// HashPassword function
const bcrypt = require('bcrypt');
const nodeMailer = require('nodemailer');

const hashPassword = async (password) => {
    try {
        const salt = await bcrypt.genSalt(10);
        const hashedPassword = await bcrypt.hash(password, salt);
        return hashedPassword;
    } catch (error) {
        console.error('Error hashing the password:', error);
    }
};

const uploadImage = (Path) => {
    const multer = require('multer');
    const storage = multer.diskStorage({
        destination: (req, file, cb) => {
            cb(null, Path);
        },
        filename: (req, file, cb) => {
            cb(null, file.originalname);
        },
    });
    const upload = multer({ storage: storage });
    return upload;
};

// Send email function
const sendEmail = async (email, subject, text) => {
    const transporter = nodeMailer.createTransport({
        service: 'gmail',
        auth: {
            user: process.env.EMAIL,
            pass: process.env.PASSWORD,
        },
    });
    const mailOptions = {
        from: process.env.EMAIL,
        to: email,
        subject: subject,
        text: text,
    };
    try {
        await transporter.sendMail(mailOptions);
        console.log('Email sent successfully');
    } catch (error) {
        console.error('Error sending email:', error);
    }
};


module.exports = { hashPassword, uploadImage, sendEmail };
